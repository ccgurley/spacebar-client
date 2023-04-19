# spacebar-client

Docker compose example:
```yaml
version: '2.1'
services:
  spacebar-server:
    image: ccgurley/spacebar-client:latest
    container_name: spacebar-client
    environment:
      SERVER_API: 'https://api.spacebar.chat'
      SERVER_CDN: 'https://cdn.spacebar.chat'
      SERVER_GATEWAY: 'wss://gateway.spacebar.chat'
    ports:
      - 3002:80
```
