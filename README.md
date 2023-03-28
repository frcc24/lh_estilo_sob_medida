# estilo_sob_medida

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# lh_estilo_sob_medida


## firestore

users (coleção): armazena informações sobre os usuários.
    uid (documento): ID do usuário.
    username: nome de usuário.
    email: endereço de e-mail.
    profile_picture: URL da imagem do perfil.
    bio: biografia do usuário (opcional).

posts (coleção): armazena informações sobre as postagens.
    postId (documento): ID da postagem.
    userId: ID do usuário que criou a postagem.
    imageUrl: URL da imagem.
    caption: legenda da imagem (texto).
    timestamp: data e hora da criação da postagem.
    likes: número de curtidas.

likes (coleção): armazena informações sobre as curtidas das postagens.
    likeId (documento): ID da curtida.
    userId: ID do usuário que curtiu a postagem.
    postId: ID da postagem que foi curtida.

comments (coleção): armazena informações sobre os comentários nas postagens.
    commentId (documento): ID do comentário.
    userId: ID do usuário que criou o comentário.
    postId: ID da postagem em que o comentário foi feito.
    text: texto do comentário.
    timestamp: data e hora da criação do comentário.

followers (coleção): armazena informações sobre os seguidores dos usuários.
    userId (documento): ID do usuário que está sendo seguido.
    followers (coleção): lista de seguidores.
    followerId (documento): ID do seguidor.

following (coleção): armazena informações sobre quem os usuários estão seguindo.
    userId (documento): ID do usuário que segue outros usuários.
    following (coleção): lista de usuários que estão sendo seguidos.
    followingId (documento): ID do usuário que está sendo seguido.