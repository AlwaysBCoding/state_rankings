$ ->
	$(".sortable").sortable
		items: ".state"
		update: (event, ui) ->
			sortables = ui.item.parent().find(".state")
			sortorder = []
			_.each sortables, (item) ->
				sortorder.push $(item).attr("data-id")
			$.post "/update_state_rankings", { 'rankings[]': sortorder }

