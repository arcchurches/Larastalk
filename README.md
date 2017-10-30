# Larastalk
A deploy script for packaging a Laravel app for AWS Elastic Beanstalk (EBS) deployment

# Usage
1. Replace the "app_name" folder with your Laravel app.
2. Configure your environments under "deploy_assets". You'll want an environment folder for each environment in EBS you want to deploy.
3. Under each environment, create a folder matching your Laravel app folder you created in step 1.
        i.e. "/deploy_assets/--environment--/app_name"
4. Configure the environment by adding ebextensions, scripts, cron.yaml, and .env files to your "/deploy_assets/--environment--/app_name" folder.
5.Run "deploy.sh" in the root directory.
6. When prompted, specify your source folder from step 1
        i.e. "app_name"
7. Specify the version number of this package. You can specify any version but specifying the same version twice will overwrite the existing version.
        i.e. "001"
8. Specify the environment
        i.e. "staging"

The script will now create a deployable version by copying the source to a new folder, then combining the files and scripts in your environment folder. The package will then be zipped and ready to upload to EBS.

# A Heads up on scheduled tasks
If your app uses cron, You will need to have one environment running as a worker environment and will need to use a load balancing cron setup. the cron.yaml example calls /worker/schedule on whichever node responds and runs the scheduled job on that node. Your app will need to be configured to run your scheduled jobs when /worker/schedule is called.
