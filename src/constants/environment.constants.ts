// import { Environment } from "./../enums/environment.enum";

const env = process.env;

// export const ENVIRONMENT: Environment = env.ENVIRONMENT as Environment;

export const MESSAGE_QUEUE_URL = env["MESSAGE_QUEUE_URL"] as string;

export const AWS_REGION = env["AWS_REGION"] as string;

export const S3_BUCKET_NAME = env["S3_BUCKET_NAME"] as string;
