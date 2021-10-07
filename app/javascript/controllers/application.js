import { Application } from "stimulus"
import { AbymeController } from 'abyme';

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application
application.register('abyme', AbymeController)

export { application }
