#!/bin/bash

# Simply supply a Message to the logger utility
logger "Message"

# The syslog standard uses facilities and severities to categories messages.
# Facilities: kern, user, mail, daemon, auth, local0, local7
# Serverities: emerg, alert, crit, err, warning, notice, info, debug
# By default the logger utility creates user.notice messages.

# -p for using facility.severity
logger -p local0.info "Message"

# Display the message on the screen in addition to sending it to logging system
logger -s -p local0.info "Message"

# tag your message, use name of the script as tag
logger -t myscript -p local0.info "Message"

# include PID
logger -i -t myscript "Message"
