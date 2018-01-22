class V1::CommentsController < ApplicationController
  before_action :setup_doctor
  before_action :setup_comment, only: [:show, :update, :destroy]

  def index
    json_response(@doctor.comments)
  end

  def show
    json_response(@comment)
  end

  def create
    @comment = @doctor.comments.create!(comment_params)
    @related_doctors = @doctor.related_doctors
    response = { comment: @comment, recommended_doctors: @related_doctors }
    json_response(response, :created)
  end

  def update
    @comment.update(comment_params)
    head :no_content
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    # fields = %i[comment_body rating author_id]
    # For admin to be able to flag comment as active after review
    # fields << :active if current_user&.admin?
    # params.require(:comment).permit(fields)
    params.permit(:comment_body, :rating, :author_id)
  end

  def setup_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def setup_comment
    @comment = @doctor.comments.find_by!(id: params[:id])
  end
end
