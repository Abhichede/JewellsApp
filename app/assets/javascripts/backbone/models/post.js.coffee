class JewellsApp.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null

class JewellsApp.Collections.PostsCollection extends Backbone.Collection
  model: JewellsApp.Models.Post
  url: '/posts'
