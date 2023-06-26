class SheetsController < ApplicationController
  before_action :set_sheet, only: %i[show edit update destroy]

  # GET /sheets or /sheets.json
  def index
    @sheets = Sheet.all

    if params[:movie_id] == 1
      @screen = make_screen(1)
      @number = 1
    elsif params[:movie_id] == 2
      @screen = make_screen(2)
      @number = 2
    else
      @screen = make_screen(3)
      @number = 3
    end

    @hash = {}
    @hash_size = 0
    @screen_count = @screen.count
    @count_start = @screen.minimum(:sheet_id)
    @count_end = @screen.maximum(:sheet_id)
    @cnt = 0
    @first_cnt = @screen[0].sheet.id
  end

  # GET /sheets/1 or /sheets/1.json
  def show; end

  # GET /sheets/new
  def new
    @sheet = Sheet.new
  end

  # GET /sheets/1/edit
  def edit; end

  # POST /sheets or /sheets.json
  def create
    @sheet = Sheet.new(sheet_params)

    respond_to do |format|
      if @sheet.save
        format.html { redirect_to @sheet, notice: 'Sheet was successfully created.' }
        format.json { render :show, status: :created, location: @sheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sheets/1 or /sheets/1.json
  def update
    respond_to do |format|
      if @sheet.update(sheet_params)
        format.html { redirect_to @sheet, notice: 'Sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheets/1 or /sheets/1.json
  def destroy
    @sheet.destroy
    respond_to do |format|
      format.html { redirect_to sheets_url, notice: 'Sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sheet
    @sheet = Sheet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sheet_params
    params.fetch(:sheet, {})
  end

  def make_screen(number)
    screen = Screen.where(screen_number: number)
  end
end
