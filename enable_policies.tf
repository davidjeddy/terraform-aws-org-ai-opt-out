resource "terraform_data" "this" {
  provisioner "local-exec" {
    command = "aws organizations enable-policy-type --root-id $(aws organizations list-roots | jq -r \".Roots[].Id\") --policy-type AISERVICES_OPT_OUT_POLICY"
    interpreter = [
      "/bin/bash",
      "-c"
    ]
  }
}
