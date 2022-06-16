import { Application } from "stimulus"
import { AbymeController } from 'abyme';

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application
application.register('abyme', AbymeController)

export { application }

$(document).on("turbolinks:load", function() {
  gtag('config', 'G-4F8HCV9K9D', {'page_location': event.data.url});
})
