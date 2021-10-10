class CompletedAssignmentsController < ApplicationController

  def show
    @completed_assignments.each do |completed_assignment|
      completed_assignment.where(assignment_id: assignment.id)
    end
  end

end
