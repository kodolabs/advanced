module Advanced
  module ActiveRecord
    module DSL
      def where_eq(param, column: param)
        define_search param, [param] do |value|
          where column => value
        end
      end

      def where_any_eq(param, column: param)
        define_search param, [param] do |values|
          values = values.reject(&:blank?)
          where column => values if values.any?
        end
      end

      def where_lt(param, column: param)
        where_arel(:lt, param, column:)
      end

      def where_gt(param, column: param)
        where_arel(:gt, param, column:)
      end

      def where_lteq(param, column: param)
        where_arel(:lteq, param, column:)
      end

      def where_gteq(param, column: param)
        where_arel(:gteq, param, column:)
      end

      private

      def where_arel(meth, param, column: param)
        define_search param, [param] do |value|
          where(arel_table[column].send(meth, value))
        end
      end
    end
  end
end
