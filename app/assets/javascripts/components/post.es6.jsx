class Post extends React.Component {

  renderPosts() {
    return this.props.posts.map((post) => {

      return (
        <div key={post.id}>
          <div>User: {post.user_id}</div>
          <div>Text: {post.text}</div>
        </div>
      );
    });
  }

  render() {
    return (
      <div>
        <div className="chat-message">
          {this.renderPosts()}
        </div>
      </div>
    );
  }
}