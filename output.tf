/*
output "machine_id" {
  description = "The ID of the instance"
  value       = try(aws_instance.ec2_test[*].id, "")
}
output "machine_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test[*].instance_state
}
output "machine_type" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test[*].instance_type
}

output "iam_role" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test[*].iam_instance_profile
}


output "image_id" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test[*].ami
}

output "private_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = try(aws_instance.ec2_test[*].private_ip, "")
}
output "vpc_id" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = try(aws_instance.ec2_test[*].vpc_id, "")
}

output "subnet_id" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = try(aws_instance.ec2_test[*].subnet_id, "")
}
output "ec2_test_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = try(aws_instance.ec2_test[*].tags, {})
}
output "network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = try(aws_instance.ec2_test[*].primary_network_interface_id, "")
}


output "root_block_device_volume_id" {
  description = "The volume Id of root block device"
  value       = aws_instance.ec2_test[*].root_block_device[0].volume_id
}

output "root_block_device_volume_size" {
  description = "The volume size of root block device"
  value       = aws_instance.ec2_test[*].root_block_device[0].volume_size
}
output "root_block_device_volume_type" {
  description = "The volume type of root block device"
  value       = aws_instance.ec2_test[*].root_block_device[0].volume_type
}
output "root_block_device" {
  description = "The name of root block device"
  value       = aws_instance.ec2_test[*].root_block_device[0].device_name
}
output "root_block_device_encrytion" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test[*].root_block_device[0].encrypted
}

output "ebs_block_device" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
    value       = aws_instance.ec2_test.ebs_block_device
    
}
output "ebs_block_device" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.ec2_test[*].ebs_block_device[*].device_name

}*/
output "machine_values" {
  description = "Alternatively way  of resource values."
  value = { for k, v in aws_instance.ec2_test : k => {
    name = v.private_ip
    coun = "${k}"
    machine_id   = v.id
    machine_state = v.instance_state
    resource_name = v.tags.Name
    machine_type = v.instance_type
    iam_role = v.iam_instance_profile
    image_id = v.ami
    vpc_id = v.vpc_security_group_ids
    subnet_id = v.subnet_id
    network_interface_id = v.primary_network_interface_id
    root_block_device_volume_id = v.root_block_device[*]
    ebs_block_device_volume_id = v.ebs_block_device[*]
    ec2_test_tags_all = v.tags
    }
    }
}











