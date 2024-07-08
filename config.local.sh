# Set your project ID
PROJECT_ID="<project-id>"
PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
USER_EMAIL="<user-email>"

#Enable the cloud build API
gcloud services enable cloudbuild.googleapis.com --project=$PROJECT_ID
#Enable cloud run API
gcloud services enable run.googleapis.com --project=$PROJECT_ID
#Enable secret manager API
gcloud services enable secretmanager.googleapis.com --project=$PROJECT_ID
#Enable Vertex AI API
gcloud services enable aiplatform.googleapis.com --project=$PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member=$USER_EMAIL \
  --role="roles/iam.serviceAccountTokenCreator"