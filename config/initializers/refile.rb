require "refile/s3"

aws = {
  access_key_id: "xyz",
  secret_access_key: "abc",
  region: "sa-east-1",
  bucket: "my-bucket",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
