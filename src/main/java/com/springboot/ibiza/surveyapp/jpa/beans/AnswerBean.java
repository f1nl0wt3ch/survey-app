package com.springboot.ibiza.surveyapp.jpa.beans;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.CreatedDate;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "ibiza_answer")
public class AnswerBean {

	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="answer_id", nullable=false)
	private int answerId;
	
	@Column(name="answer_str")
	private String answerStr;
	
	@ManyToOne
	@JsonIgnoreProperties(value = {"questionId", "answerOptions", "questionary", "questionType", })
	@JoinColumn(name="fk_question_id")
	private QuestionBean question;
	
	@ManyToMany
	@JsonIgnoreProperties(value = { "answers", "question"})
	@JoinTable(
		name = "answers_chosen",
		joinColumns = @JoinColumn(name = "answer_id"),
		inverseJoinColumns = @JoinColumn(name = "answer_option_id"))
	Set<AnswerOptionBean> chosenAnswers;
	
	/*@ManyToOne
	@JsonIgnoreProperties(value = {"answerOptionId", "answers", "question"})
	@JoinColumn(name="fk_answer_option_id", nullable=true)
	private AnswerOptionBean answerOption;
	*/
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name = "answered_date", nullable = true, updatable = false)
    @CreatedDate
    private Date answeredDate;
	
	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public QuestionBean getQuestion() {
		return question;
	}

	public void setQuestion(QuestionBean question) {
		this.question = question;
	}

	
	public Set<AnswerOptionBean> getChosenAnswers() {
		return chosenAnswers;
	}

	public void setChosenAnswers(Set<AnswerOptionBean> chosenAnswers) {
		this.chosenAnswers = chosenAnswers;
	}

	public Date getAnsweredDate() {
		return answeredDate;
	}

	public void setAnsweredDate(Date answeredDate) {
		this.answeredDate = answeredDate;
	}
	public String getAnswerStr() {
		return answerStr;
	}

	public void setAnswerStr(String answerStr) {
		this.answerStr = answerStr;
	}
	
	
}
