Backbone.Marionette.Renderer.render = (template, data) ->
  return HandlebarsTemplates['templates/' + template](data);
