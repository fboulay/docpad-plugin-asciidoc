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
				asciidoctor = require('asciidoctor.js')()

				processor = null
				useExtensions = @config.enableExtensions
				if useExtensions
				  processor = asciidoctor.Asciidoctor(true)
				else
				  processor = asciidoctor.Asciidoctor()

				# Render synchronously
				opts.content = processor.$convert(opts.content)
			# Done
			return
