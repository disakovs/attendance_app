require 'rails_helper'

RSpec.describe ClassroomsController do
  
  describe 'GET show' do
    let!(:classroom) { Fabricate(:classroom) }
    
    context "with authenticated user not admin" do
      before do 
        set_regular_user
      end
      
      it "has 1 class in Classroom class" do
        expect(Classroom.count).to eq(1)
      end
      
      it "sets @classroom" do
        get :show, params:{id: classroom.id}
        expect(assigns(:classroom)).to eq(classroom)
      end
    end
    
    it_behaves_like "require_regular_sign_in" do
      let(:action) { get :show, params:{id: classroom.id}}
    end
  end

  describe "GET index" do
    let!(:gymnastics_class) { Classroom.create(name: 'Gymnastics', age_limit: '2-3', classroom_type: "gymnastics") }
    let!(:parkour_class) { Classroom.create(name: 'Parkour', age_limit: '2-3', classroom_type: "parkour") }
    
    context "with authorized user" do
      before do
        set_admin_user
        get :index
      end
      
      it "has 2 classes in Classroom class" do
        expect(Classroom.count).to eq(2)
      end
      
      it 'sets @parkour_classes variable' do
        expect(assigns(:parkour_classes)).to eq([parkour_class])
      end
      
      it 'sets @gymnastics_classes variable' do
        expect(assigns(:gymnastics_classes)).to eq([gymnastics_class])
      end
      
      it 'renders index template' do
        expect(response).to render_template('index')
      end
      
      it_behaves_like "require_regular_sign_in" do
        let(:action) { get :index}
      end
    end
  end
  
  describe "GET new" do
    context "with authorized admin user" do
      before do
        set_admin_user
        get :new
      end
      
      it 'sets the @classroom variable' do
        expect(assigns(:classroom)).to be_instance_of(Classroom)
      end
      
      it "render the new template" do
        expect(response).to render_template('new')
      end
    end
    
    it_behaves_like "require_admin_sign_in" do
        let(:action) {get :new}
    end
  end
end
