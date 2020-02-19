REM Upload files to S3
aws s3 cp site s3://tilburgsciencehub.com/ --recursive --region eu-central-1
pause