# frozen_string_literal: true

#
#     This file is part of Origami, PDF manipulation framework for Ruby
#     Copyright (C) 2016	Guillaume Delugré.
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
  module Filter
    #
    # Class representing a Filter used to encode and decode data with JBIG2 compression algorithm.
    #
    class JBIG2
      include Filter

      class DecodeParms < Dictionary
        include StandardObject

        field :JBIG2Globals, Type: Stream
      end

      def initialize(parameters = {})
        super(DecodeParms.new(parameters))
      end

      #
      # Not supported.
      #
      def encode(stream)
        raise NotImplementedError.new("#{self.class} is not yet supported", input_data: stream)
      end

      #
      # Not supported.
      #
      def decode(stream)
        raise NotImplementedError.new("#{self.class} is not yet supported", input_data: stream)
      end
    end
  end
end
