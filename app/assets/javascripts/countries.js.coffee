$ ->
	$(".sortable").sortable
		items: ".state"
		update: (event, ui) ->
			sortables = ui.item.parent().find(".state")
			sortorder = []
			_.each sortables, (item) ->
				sortorder.push $(item).attr("data-id")
			$.ajax({
				type: "POST",
				url: "/update_state_rankings",
				data: { 'rankings[]': sortorder }
				success: (data) ->
					_.each data, (state, index) ->
						$($(".state")[index]).attr("data-ranking", index+1)
					_.each data, (state, index) ->
						$state = $($(".ranking")[index])
						ranking = $state.parent().parent().data("ranking")
						$state.text("#{index+1}")
						updateRankingClasses($state, ranking)
				})

# ABSTRACTED METHODS
	updateRankingClasses = (state, ranking) ->
		state.addClass("under-10") if ranking < 10 and !state.hasClass("under-10")
		state.removeClass("over-10") if ranking < 10 and state.hasClass("over-10")
		# state.addClass("over-10") if ranking >= 10 and !state.hasClass("over-10")
		# state.removeClass("under-10") if ranking >= 10 and state.hasClass("under-10")
