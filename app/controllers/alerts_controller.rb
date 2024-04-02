class AlertsController < ApplicationController
  def index
    matching_alerts = Alert.all

    @list_of_alerts = matching_alerts.order({ :created_at => :desc })

    render({ :template => "alerts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_alerts = Alert.where({ :id => the_id })

    @the_alert = matching_alerts.at(0)

    render({ :template => "alerts/show" })
  end

  def create
    the_alert = Alert.new
    the_alert.external_data_id = params.fetch("query_external_data_id")

    if the_alert.valid?
      the_alert.save
      redirect_to("/alerts", { :notice => "Alert created successfully." })
    else
      redirect_to("/alerts", { :alert => the_alert.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_alert = Alert.where({ :id => the_id }).at(0)

    the_alert.external_data_id = params.fetch("query_external_data_id")

    if the_alert.valid?
      the_alert.save
      redirect_to("/alerts/#{the_alert.id}", { :notice => "Alert updated successfully."} )
    else
      redirect_to("/alerts/#{the_alert.id}", { :alert => the_alert.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_alert = Alert.where({ :id => the_id }).at(0)

    the_alert.destroy

    redirect_to("/alerts", { :notice => "Alert deleted successfully."} )
  end
end
