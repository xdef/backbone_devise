class BD.Views.Layouts.Main extends Backbone.Marionette.Layout
  template: 'layouts/main',
  regions:
    content: '#content'

BD.addInitializer( () -> BD.layouts.main = new BD.Views.Layouts.Main() )
