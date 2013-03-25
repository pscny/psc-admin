module FetchHelpers
  def fetch_admin(email)
    fetch Admin, :email => email
  end

  def fetch_member(email)
    fetch Member, :email => email
  end

  def fetch_concert_series(name)
    fetch ConcertSeries, :name => name
  end

  def fetch_subscription(name)
    warn "Bad Fetch"
    series = fetch ConcertSeries, :name => name
    series.subscriptions.last
  end

  private

  def fetch(klass, where_opts)
    klass.where(where_opts).first or
      raise "No #{klass} found for #{where_opts.inspect}"
  end

  def fetch_or_create(klass, where_opts)
    klass.where(where_opts).first or
      create(klass.name.underscore.to_sym, where_opts)
  end
end

World(FetchHelpers)
