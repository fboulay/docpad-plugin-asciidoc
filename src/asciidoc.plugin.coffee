# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class AsciidocPlugin extends BasePlugin
		# Plugin name
		name: 'asciidoc'

		# Plugin configuration
		config:
			enableExtensions: false

		# Render
		# Called per document, for each extension conversion. Used to render one extension to another.
		render: (opts) ->
			# Prepare
			{inExtension,outExtension} = opts

			if inExtension in ['adoc' ] and outExtension in ['html',null]
				processor = require('asciidoctor.js')()

				# Render synchronously
				opts.content = processor.convert(opts.content)
			# Done
			return
