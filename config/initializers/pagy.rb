# frozen_string_literal: true

require 'pagy/extras/metadata'

Pagy::DEFAULT[:metadata] = %i[first_url prev_url next_url last_url count page items]
Pagy::DEFAULT[:items] = 10
Pagy::DEFAULT[:items_parms] = :items
