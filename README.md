```
 _____                _       _            _ _   _      ______  ___  _____ 
|  __ \              (_)     (_)          (_) | | |     | ___ \/ _ \|  __ \
| |  \/ ___ _ __ ___  _ _ __  _  __      ___| |_| |__   | |_/ / /_\ \ |  \/
| | __ / _ \ '_ ` _ \| | '_ \| | \ \ /\ / / | __| '_ \  |    /|  _  | | __ 
| |_\ \  __/ | | | | | | | | | |  \ V  V /| | |_| | | | | |\ \| | | | |_\ \
 \____/\___|_| |_| |_|_|_| |_|_|   \_/\_/ |_|\__|_| |_| \_| \_\_| |_/\____/
                                                                           
                                                                           
```


## Disclaimer

This is a demo project. It has been developed for learning purposes and published in a public repository for inspiration to the broad community. Support will not be given on this code, and this code is not intended to be used in production.

## Getting Started

This guide will cover first how to use this repo in **local development**, and then how to deploy it into **GCP Cloud Run**. It considers a fresh project. It assumes as well you have cloned the code into your local environment. If you have no code skills, skip the local development and go straight into GCP Cloud Run.
Some steps are overlapped in both approaches, please feel free to skip them if you have already completed them.

# Local development:

## 1. Pre-configuration script

Clone the repo and run the `config.local.sh` script.

## 2. OAuth Config

The first step is going to be to create the Application Credentials in the Google Cloud Console.

- Go to `Oauth Consent Screen` to start configure it
- For `User Type` select `External` and click `Create`
- Fill app name and support email
- For Authorized Domains, you will need to have your cloud run deployed to add the right domain.
- Add Developer contact information
- Clic `Save and Continue`
- Clic `ADD OR REMOVE SCOPES`
- Select all.
- Clic `Update` and clic `Save and Continue`
- Add test users (at least the account you will use) and clic `Save and Continue`
- Click `BACK TO DASHBOARD`
- Now you need to get a client id and client secret, to connect to Google Cloud services through the app.
- Clic `Credentials` then `Create Credentials` then `OAuth client ID`
- For `Application Type` select `Web Application` and give it a name
- For `Authorized JavaScript origins` you don't need to add anything.
- For `Authorized redirect URIs` add `http://localhost:3000/api/auth/callback/google`.
- Clic `Create`
- Click on `DOWNLOAD JSON`

## 3. Create local .env files

Create the local files for the frontend, with the necessary environment variables.

- In the code, go to `frontend`
- Create a file named `.env.local`
- Inside the file, you'll need to paste the following text, modifying the values accordingly. For the client_id and the client_secret, you'll find the values in the JSON you just downloaded.

```bash
AUTH_SECRET = "your-auth-secret" #To get one, run: openssl rand -base64 32

PROJECT_ID = "your-project-id"

NEXT_PUBLIC_ENV = "dev"

GOOGLE_CLIENT = '{
    "web":
        {
            "client_id": "your-client-id",
            "client_secret": "your-client-secret"
        }
    }'
```

## 4. Run the local servers

Now, run the development server:

- Open a new terminal and run:

```bash
cd frontend
npm ci #Perform a clean install of the dependencies
npm run dev
```

- Open another terminal in parallel, and run:

```bash
cd backend
pip install -r requirements.txt #Install all the python requirements
python3 main.py
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.



## Resources:
- © https://github.com/jmugicagonz/r2d2