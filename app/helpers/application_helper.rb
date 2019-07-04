module ApplicationHelper
	def page_title
		if content_for?(:title)
			"CinemaCap - #{content_for(:title)}"
		else
			"CinemaCap"
		end
	end
end
