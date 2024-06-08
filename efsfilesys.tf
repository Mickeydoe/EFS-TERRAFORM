resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "EFS"
   }
 }


resource "aws_efs_mount_target" "mount_tg1" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.my_subnet1.id
  security_groups = [aws_security_group.allow_nfs.id]
}

resource "aws_efs_mount_target" "mount_tg2" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.my_subnet2.id
  security_groups = [aws_security_group.allow_nfs.id]

}