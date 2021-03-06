class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy, :archive, :unarchive]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all

    if params[:query].present?
      @entries = @entries.where("text LIKE ?", "%#{params[:query]}%")
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user if current_user

    respond_to do |format|
      if @entry.save
        @day = @entry.day
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render 'days/show', status: :created }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    @day = @entry.day
    @entries = @day.entries.archived # because delete is only on archived page
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { render 'days/show', status: :created }
    end
  end

  # PUT /entries/1/archive
  # PUT /entries/1/arquive.json
  def archive
    @day = @entry.day
    @entries = @day.entries.not_archived
    respond_to do |format|
      if @entry.archive
        format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { render 'days/show', status: :ok }
      end
    end
  end

  # PUT /entries/1/unarchive
  # PUT /entries/1/unarquive.json
  def unarchive
    @day = @entry.day
    @entries = @day.entries.archived
    respond_to do |format|
      if @entry.unarchive
        format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { render 'days/show', status: :ok }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:text, :datetime)
    end
end
