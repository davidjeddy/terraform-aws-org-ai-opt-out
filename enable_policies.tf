resource "terraform_data" "this" {
  provisioner "local-exec" {
    # https://stackoverflow.com/questions/57693621/unable-to-run-shell-script-in-terraform
    command = "${path.module}/apply_policy_to_organization.sh PROFILE ${data.aws_region.current.id}"
    interpreter = [
      "/bin/bash",
      "-c"
    ]
  }

  # To be sure, re-run the AWS CLI command on every run
  # https://devdosvid.blog/2023/04/16/hello-terraform-data-goodbye-null-resource/
  triggers_replace = "${timestamp()}"
}
