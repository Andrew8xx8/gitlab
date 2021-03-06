require 'spec_helper'

describe Gitlab::Client do
  describe "notes" do
    context "when wall notes" do
      before do
        stub_get("/projects/3/notes", "notes")
        @notes = Gitlab.notes(3)
      end

      it "should get the correct resource" do
        a_get("/projects/3/notes").should have_been_made
      end

      it "should return an array of notes" do
        @notes.should be_an Array
        @notes.first.author.name.should == "John Smith"
      end
    end

    context "when issue notes" do
      before do
        stub_get("/projects/3/issues/7/notes", "notes")
        @notes = Gitlab.issue_notes(3, 7)
      end

      it "should get the correct resource" do
        a_get("/projects/3/issues/7/notes").should have_been_made
      end

      it "should return an array of notes" do
        @notes.should be_an Array
        @notes.first.author.name.should == "John Smith"
      end
    end

    context "when snippet notes" do
      before do
        stub_get("/projects/3/snippets/7/notes", "notes")
        @notes = Gitlab.snippet_notes(3, 7)
      end

      it "should get the correct resource" do
        a_get("/projects/3/snippets/7/notes").should have_been_made
      end

      it "should return an array of notes" do
        @notes.should be_an Array
        @notes.first.author.name.should == "John Smith"
      end
    end

    context "when merge request notes" do
      before do
        stub_get("/projects/3620/merge_requests/255/notes", "notes")
        @notes = Gitlab.merge_request_notes(3620, 255)
      end
      it "should get the correct resource" do
        a_get("/projects/3620/merge_requests/255/notes").should have_been_made
      end

      it "should return an array of notes" do
        @notes.should be_an Array
        @notes.first.author.name.should == "John Smith"
      end
    end
  end

  describe "note" do
    context "when wall note" do
      before do
        stub_get("/projects/3/notes/1201", "note")
        @note = Gitlab.note(3, 1201)
      end

      it "should get the correct resource" do
        a_get("/projects/3/notes/1201").should have_been_made
      end

      it "should return information about a note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

    context "when issue note" do
      before do
        stub_get("/projects/3/issues/7/notes/1201", "note")
        @note = Gitlab.issue_note(3, 7, 1201)
      end

      it "should get the correct resource" do
        a_get("/projects/3/issues/7/notes/1201").should have_been_made
      end

      it "should return information about a note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

    context "when snippet note" do
      before do
        stub_get("/projects/3/snippets/7/notes/1201", "note")
        @note = Gitlab.snippet_note(3, 7, 1201)
      end

      it "should get the correct resource" do
        a_get("/projects/3/snippets/7/notes/1201").should have_been_made
      end

      it "should return information about a note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

    context "when merge_request note" do
      before do
        stub_get("/projects/3/merge_requests/255/notes/1201", "note")
        @note = Gitlab.merge_request_note(3, 255, 1201)
      end

      it "should get the correct resource" do
        a_get("/projects/3/merge_requests/255/notes/1201").should have_been_made
      end

      it "should return information about a note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

  end

  describe "create note" do
    context "when wall note" do
      before do
        stub_post("/projects/3/notes", "note")
        @note = Gitlab.create_note(3, "The solution is rather tricky")
      end

      it "should get the correct resource" do
        a_post("/projects/3/notes").
          with(:body => {:body => 'The solution is rather tricky'}).should have_been_made
      end

      it "should return information about a created note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

    context "when issue note" do
      before do
        stub_post("/projects/3/issues/7/notes", "note")
        @note = Gitlab.create_issue_note(3, 7, "The solution is rather tricky")
      end

      it "should get the correct resource" do
        a_post("/projects/3/issues/7/notes").
          with(:body => {:body => 'The solution is rather tricky'}).should have_been_made
      end

      it "should return information about a created note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

    context "when snippet note" do
      before do
        stub_post("/projects/3/snippets/7/notes", "note")
        @note = Gitlab.create_snippet_note(3, 7, "The solution is rather tricky")
      end

      it "should get the correct resource" do
        a_post("/projects/3/snippets/7/notes").
          with(:body => {:body => 'The solution is rather tricky'}).should have_been_made
      end

      it "should return information about a created note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

    context "when merge request note" do
      before do
        stub_post("/projects/3/merge_requests/255/notes", "note")
        @note = Gitlab.create_merge_request_note(3, 225, "The solution is rather tricky")
      end

      it "should get the correct resource" do
        a_post("/projects/3/merge_requests/255/notes").
          with(:body => {:body => 'The solution is rather tricky'}).should have_been_made
      end

      it "should return information about a created note" do
        @note.body.should == "The solution is rather tricky"
        @note.author.name.should == "John Smith"
      end
    end

  end
end
