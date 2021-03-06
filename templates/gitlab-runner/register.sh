docker run -it --rm -v /mnt/efs/gitlab-runner:/etc/gitlab-runner
gitlab/gitlab-runner
register
--non-interactive
--name "autoscale-runner"
--url https://${gitlab_host}
--registration-token ${runner_token}
--executor "docker+machine"
--limit 20
--docker-image "docker:19.03"
--docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
--machine-idle-nodes 0
--machine-idle-time 60
--machine-machine-name "${project}-%s"
--machine-machine-driver "amazonec2"
--machine-machine-options "amazonec2-access-key=${access_key}"
--machine-machine-options "amazonec2-secret-key=${secret_key}"
--machine-machine-options "amazonec2-region=${region}"
--machine-machine-options "amazonec2-vpc-id=${vpc_id}"
--machine-machine-options "amazonec2-subnet-id=${subnet_id}"
--machine-machine-options "amazonec2-security-group=${security_group}"
--machine-machine-options "amazonec2-private-address-only"
--machine-machine-options "amazonec2-instance-type=t3a.medium"
--machine-machine-options "amazonec2-request-spot-instance"
--machine-machine-options "amazonec2-spot-price=0.1"
--cache-type "s3"
--cache-s3-server-address "s3.amazonaws.com"
--cache-s3-access-key "${access_key}"
--cache-s3-secret-key "${secret_key}"
--cache-s3-bucket-name "${bucket_name}"
--cache-s3-bucket-location "${region}"
--cache-cache-shared "true"
