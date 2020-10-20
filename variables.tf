/**
 * Copyright 2019 Mantel Group Pty Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "gcp_project" {
  type        = string
  description = "The GCP project to deploy the runner into."
}
variable "gcp_zone" {
  type        = string
  description = "The GCP zone to deploy the runner into."
}
variable "gitlab_url" {
  type        = string
  description = "The URL of the GitLab server hosting the projects to be built."
}
variable "ci_token" {
  type        = string
  description = "The runner registration token obtained from GitLab."
}
variable "ci_runner_instance_name" {
  type        = string
  description = "The name of the runner to be identified inside gitlab"
}
variable "ci_runner_instance_type" {
  type        = string
  default     = "e2-micro"
  description = <<EOF
The instance type used for the runner. This shouldn't need to be changed because the builds
themselves run on separate worker instances.
EOF
}
variable "ci_concurrency" {
  type        = number
  default     = 1
  description = "The maximum number of worker instances to create."
}
variable "ci_worker_idle_time" {
  type        = number
  default     = 300
  description = "The maximum idle time for workers before they are shutdown."
}
variable "ci_worker_instance_type" {
  type        = string
  default     = "n1-standard-1"
  description = "The worker instance size.  This can be adjusted to meet the demands of builds jobs."
}
variable "ci_runner_tags" {
    type        = string
    default     = "gcp, devops"
    description = "Gitlab Tags for the new runner"
}
# Create the Gitlab CI Runner instance.
variable "ci_runner_untagged" {
    type        = string
    default     = "true"
    description = "also run jobs without any tags"
}
variable "runner_service_account_id" {
  type = string
  default = "gitlab-ci-runner"
  description = "service account name before @ in email"
}
variable "worker_service_account_id" {
  type = string
  default = "gitlab-ci-worker"
  description = "service account name before @ in email"
}
variable "instance_network" {
  type = string
  default = "default"
  description = "Name of google VPC network"
}
variable "boot_disk_size" {
  type = string
  default = "20"
  description = "Runner instance boot disk size in GB, it should be more than image size"
}
variable "instance_image" {
  type = string
  default = "centos-cloud/centos-7"
  description = "Instance boot OS image"
}
variable "instance_boot_disk_type" {
  type = string
  default = "pd-standard"
  description = "Type of the runner instance boot disk pd-standard or pd-ssd"
}
variable "worker_instance_disk_size" {
  type = number
  default = 20
  description = "Runner instance boot disk size in GB"
}
variable "worker_instance_disk_type" {
  type = string
  default = "pd-ssd"
  description = "Type of the worker instance boot disk pd-standard or pd-ssd"
}
variable "docker_image" {
  type = string
  default = "bhdevops/gitlab-php-builder:2"
  description = "Image which will be use as a builder to compile code"
}
variable "preemptible" {
  type = bool
  default = true
  description = "Define using lower cost preebmtible nodes as a worker node (true or false)"
}