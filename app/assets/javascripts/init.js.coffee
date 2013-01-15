BD = new Backbone.Marionette.Application();

BD.Views = {};
BD.Views.Layouts = {};
BD.Models = {};
BD.Collections = {};
BD.Routers = {};
BD.Helpers = {};

# Instantiated global layouts
BD.layouts = {};

BD.addRegions(
  main: '#main'
)

BD.vent.on("authentication:logged_in", () -> BD.main.show(BD.layouts.main) )
BD.vent.on("authentication:logged_out", () -> BD.main.show(BD.layouts.unauthenticated) )

BD.bind("initialize:after", () ->
  if(BD.currentUser)
    BD.vent.trigger("authentication:logged_in");
  else
    BD.vent.trigger("authentication:logged_out");
)

# TODO: Routers and history start
# BD.vent.on("layout:rendered", () -> Backbone.history.start({pushState: true}) )
