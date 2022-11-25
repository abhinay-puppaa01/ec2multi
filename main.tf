locals {
  ebs_volumes = tolist([
    for i, n in var.ebs_block_device_name : {
      device_name    = var.ebs_block_device_name[i]
      volume_size    = var.ebs_block_volume_size[i]
      volume_type = var.ebs_block_volume_type[i]
      iops = var.ebs_block_volume_iops[i]
    }
  ])
}


resource "aws_instance" "ec2_test" {
  count = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  ebs_optimized          = var.ebs_optimized
  private_ip             = var.private_ip
  tenancy                = var.tenancy
  host_id                = var.host_id
  tags                   = merge({ "Name" = "${var.instance_name}-${count.index}" ,"RequestedBy"="${var.RequestedBy}"}, var.tags)

  root_block_device {
    volume_size           = var.root_block_device_volume_size
    volume_type           = var.root_block_device_volume_type
    encrypted             = var.ebs_optimized
    delete_on_termination = true
    tags                  = merge({ "Name" = "root-${var.instance_name}-${count.index}" }, var.tags)
  }

  dynamic "ebs_block_device" {
    for_each = local.ebs_volumes
    content {
      volume_type = lookup(ebs_block_device.value, "volume_type", null)
      volume_size = lookup(ebs_block_device.value, "volume_size", null)
      tags        = merge({ "Name" = "${var.instance_name}-${timestamp()}" }, var.tags)
      iops        = lookup(ebs_block_device.value, "iops", null)
      device_name = lookup(ebs_block_device.value, "device_name", null)
     }
  }



}
