resource "aws_alb" "main" {
  name               = "MainELBv2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]

  tags = {
    Name = "Main elb"
  }
}

resource "aws_alb_target_group" "web" {
  name     = "WebTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    Name = "Web TG"
  }
}

resource "aws_alb_target_group" "db" {
  name     = "DbTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  tags = {
    Name = "DB TG"
  }
}

resource "aws_alb_target_group_attachment" "web1" {

  target_group_arn = aws_alb_target_group.web.arn
  target_id        = aws_instance.web1.id
  port             = 80
}
resource "aws_alb_target_group_attachment" "web2" {
  target_group_arn = aws_alb_target_group.web.arn
  target_id        = aws_instance.web2.id
  port             = 80
}

resource "aws_alb_target_group_attachment" "db1" {
  target_group_arn = aws_alb_target_group.db.arn
  target_id        = aws_instance.db1.id
  port             = 80
}

resource "aws_alb_target_group_attachment" "db2" {
  target_group_arn = aws_alb_target_group.db.arn
  target_id        = aws_instance.db2.id
  port             = 80
}

resource "aws_alb_listener" "web" {
  load_balancer_arn = aws_alb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.web.arn
  }
}


resource "aws_alb_listener_rule" "db" {
  listener_arn = aws_alb_listener.web.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.db.arn
  }

  condition {
    path_pattern {
      values = ["/phpMyAdmin/*"]
    }
  }
}

