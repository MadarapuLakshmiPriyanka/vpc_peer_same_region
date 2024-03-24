resource "aws_vpc_peering_connection" "requester" {
  peer_owner_id = "679309468658"
  vpc_id = aws_vpc.dev.id
  peer_vpc_id = aws_vpc.test.id
  auto_accept = false
  peer_region = "us-east-1"
  tags = {
    "Name" = "requester"
  }
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id=aws_vpc_peering_connection.requester.id
  auto_accept = true
  tags = {
    "Name" = "accepter"
  }
}