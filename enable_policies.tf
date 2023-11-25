resource "terraform_data" "this" {
  provisioner "local-exec" {
    command = "aws organizations enable-policy-type --root-id $(aws organizations list-roots | jq -r \".Roots[].Id\") --policy-type AISERVICES_OPT_OUT_POLICY"
    interpreter = [
      "/bin/bash",
      "-c"
    ]
  }

  # Ensure this resource is re-create on every run
  # https://devdosvid.blog/2023/04/16/hello-terraform-data-goodbye-null-resource/
  triggers_replace = "${timestamp()}"
}
