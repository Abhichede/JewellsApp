class JewellsApp.Models.Pos extends Backbone.Model
  paramRoot: 'pos'




class JewellsApp.Collections.PosCollection extends Backbone.Collection
  model: JewellsApp.Models.Pos
  url: '/pos'
