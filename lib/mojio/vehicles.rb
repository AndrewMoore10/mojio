module Mojio
  def self.get_vehicles
    # puts self.get_token
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/vehicles"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => self.get_token
    }
    options = {
      limit: 100,
      offset: 0,
      sortBy: "Name"
    }
    response = HTTParty.get( url, { headers: headers, query: options} )
    # puts response.to_yaml
    return response
  end

  def self.get_vehicle(vehicle_id)
    
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/vehicles/#{vehicle_id}"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => self.get_token
    }
    options = {
      # limit: 100,
      # offset: 0,
      # sortBy: "Name"
    }
    response = HTTParty.get( url, { headers: headers, query: options} )
    # puts response.to_yaml
    return response
  end

  def self.get_vehicle_details(vehicle_id)
    
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/vehicles/#{vehicle_id}/details"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => self.get_token
    }
    options = {
    }
    response = HTTParty.get( url, { headers: headers, query: options} )
    # puts response.to_yaml
    return response
  end

  def self.get_vehicle_diags(vehicle_id)
    
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/vehicles/#{vehicle_id}/diagnostics"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => self.get_token
    }
    options = {
    }
    response = HTTParty.get( url, { headers: headers, query: options} )
    # puts response.to_yaml
    return response
  end

  def self.get_vehicle_trips(vehicle_id, timeframe = 1.days)
    
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/vehicles/#{vehicle_id}/trips"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => self.get_token
    }
    options = {
      limit: 15,
      offset: 0,
      desc: true,
      criteria: "Time=#{(DateTime.now - timeframe).strftime("%m.%e.%y")}-#{(DateTime.now + 1.days).strftime("%m.%e.%y")}"
    }
    response = HTTParty.get( url, { headers: headers, query: options} )
    # puts response.to_yaml
    return response
  end

  def self.get_vehicle_events(vehicle_id, timeframe = 1.days)
    
    url = "https://#{configuration.api_host}:#{configuration.api_port}/v1/vehicles/#{vehicle_id}/events"
    headers = {
      "Content-Type" => "application/json",
      "MojioAPIToken" => self.get_token
    }
    options = {
      limit: 15,
      offset: 0,
      desc: true,
      criteria: "Time=#{(DateTime.now - timeframe).strftime("%m.%e.%y")}-#{(DateTime.now + 1.days).strftime("%m.%e.%y")}"
    }
    response = HTTParty.get( url, { headers: headers, query: options} )
    # puts response.to_yaml
    return response
  end
end