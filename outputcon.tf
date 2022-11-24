output "machine_values" {
  description = "Alternatively way  of resource values."
  value = { for k, v in aws_instance.ec2_test : k => {
    name = v.private_ip
    machine_id   = v.id
    machine_state = v.instance_state
    resource_name = v.tags.Name
    machine_type = v.instance_type
    iam_role = v.iam_instance_profile
    image_id = v.ami
    vpc_id = v.vpc_security_group_ids
    subnet_id = v.subnet_id
    network_interface_id = v.primary_network_interface_id
    root_block_device_device_name = v.root_block_device[*].device_name
    root_block_device_volume_id = v.root_block_device[*].volume_id
    root_block_device_volume_size = v.root_block_device[*].volume_size
    root_block_device_volume_type = v.root_block_device[*].volume_type
    ebs_block_device_device_name = v.ebs_block_device[*].device_name
    ebs_block_device_volume_id = v.ebs_block_device[*].volume_id
    ebs_block_device_volume_size = v.ebs_block_device[*].volume_size
    ebs_block_device_volume_type = v.ebs_block_device[*].volume_type
    ec2_test_tags_all = v.tags
    }
    }
}
