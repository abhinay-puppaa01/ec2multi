

variable "instance_count" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = number
  default     = "<%= customOptions.instance_count%>"
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
  type        = string
  default     = "PFE-EC2-ROLE-BSL"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = null
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  type        = string
  default     = null
}
variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  type        = string
  default     = null
}
variable "host_id" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = null
}


variable "ebs_block_device_name" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["xvdf","xvdg"]
}
variable "ebs_block_volume_size" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["10","20"]
}
variable "ebs_block_volume_type" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["gp3","gp3"]
}
variable "ebs_block_volume_iops" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(string)
  default     = ["1000","1000"]
}


variable "root_block_device_volume_type" {
  description = "root_block_device_volume_type"
  type        = string
  default     = "gp2"
}
variable "root_block_device_volume_size" {
  description = "root_block_device_volume_size"
  type        = string
  default     = "30"
}



variable "access_key" {
  description = "The username of the user account used to access the Morpheus platform"
  type        = string
  sensitive  = true
}

variable "secret_key" {
  description = "AWS secret key"
   type        = string
   sensitive  = true
}

variable "region" {
  description = "AWS Region"
  type        = string
  default = "us-east-1"
#default = "<%= customOptions.region%>"
}


variable "ami" { 
  description = "Ami"
  type        = string
  default ="ami-064d05b4fe8515623"
#default = "<%= customOptions.operating_system%>"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
  default ="t2.micro"
#default = "<%= customOptions.instance_type%>"
}
variable "instance_name" {
  description = "Instance Name"
  type        = string
default = "<%= customOptions.instance_name%>"
}

variable "availability_zone" {
  description = "availability_zone"
  type        = string
  #default     = "us-east-1a"
  default = "<%= customOptions.region%>"
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
default = "<%= customOptions.subnet_id%>"
}
variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type        =  list(string)
default = ["<%= customOptions.vpc_security_group_ids.encodeAsJson().toString()%>"]
}
variable "RequestedBy" {
  description = "Email id of the user"
  type        =  string
default = <%=instance.createdByEmail%>
  
variable "primary_contact" {
  description = "Primary owner of the machine"
  type        =  string
default = "<%= customOptions.primary_contact%>""
  
 variable "secondary_contact" {
  description = "Primary owner of the machine"
  type        =  string
default = "<%= customOptions.secondary_contact%>"
  
variable "tags" {
  description = "tags"
  type        = map(string)
default = {
    "CostCenterID" : "2322748"
    "Centrify" : "Centrify"
    "Description" : "Description"
    "ProjectCode" : "A123456"
    "SharedInfrastructure" : "No"
    "ApplicationDeploymentCIID" : "SC2818380"
    "Deploymenttype" : "newprovision"
    "ProvisionType" : "IOD"
  }

}


variable "host_name" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = "<%= results.'ansible_host'%>"
}

variable "host_name1" {
  description = "ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host"
  type        = string
  default     = "<%=results.'generateHostname.Output'%>"
}



