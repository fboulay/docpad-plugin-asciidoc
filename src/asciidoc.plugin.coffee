# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class AsciidocPlugin extends BasePlugin
		# Plugin name
		name: 'asciidoc'

		# Plugin configuration
		config:
			asciidocOptions:
				extensions: false

		# Render
		# Called per document, for each extension conversion. Used to render one extension to another.
		render: (opts) ->
			# Prepare
			{inExtension,outExtension} = opts

			if inExtension in ['adoc' ] and outExtension in ['html',null]
				asciidoctor = require('asciidoctor.js')()
				# opal = asciidoctor.Opal

				processor = null
				useExtensions = @config.asciidocOptions.extensions
				if useExtensions
				  processor = asciidoctor.Asciidoctor(true)
				else
				  processor = asciidoctor.Asciidoctor()

				# Render synchronously
				opts.content = processor.$convert(opts.content)
			# Done
			return
