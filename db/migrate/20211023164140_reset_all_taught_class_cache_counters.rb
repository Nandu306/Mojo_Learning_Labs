class ResetAllTaughtClassCacheCounters < ActiveRecord::Migration[6.0]
  def change

    def up

     TaughtClass.all.each do |taught_class|
         taught_class.reset_counters(taught_class.id, :class_memberships)
      end

     TaughtClass.all.each do |taught_class|
         taught_class.reset_counters(taught_class.id, :assignments)
      end

    end

    def down

         # no rollback needed

    end
  end
end
