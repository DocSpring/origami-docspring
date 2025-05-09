# frozen_string_literal: true

#
#     This file is part of Origami, PDF manipulation framework for Ruby
#     Copyright (C) 2017	Guillaume Delugré.
#
#     Origami is free software: you can redistribute it and/or modify
#     it under the terms of the GNU Lesser General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     Origami is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU Lesser General Public License for more details.
#
#     You should have received a copy of the GNU Lesser General Public License
#     along with Origami.  If not, see <http://www.gnu.org/licenses/>.
#

module Origami
  module XDP
    module Packet
      #
      # The _sourceSet_ packet contains ADO database queries, used to describe data
      # binding to ADO data sources.
      #
      class SourceSet < XFA::Element
        mime_type 'text/xml'

        def initialize
          super("sourceSet")

          add_attribute 'xmlns', 'http://www.xfa.org/schema/xfa-source-set/2.8/'
        end
      end
    end
  end
end
