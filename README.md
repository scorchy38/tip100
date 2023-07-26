# TIP100: Your secure bridge to safer communities.

## Table of Contents
- [Introduction](#introduction)
- [Goals](#goals)
- [Achieving Anonymity & Privacy](#achieving-anonymity--privacy)
- [Tip Trust Score & Person Trust Score](#tip-trust-score--person-trust-score)
- [Machine Learning Models Implemented](#machine-learning-models-implemented)
- [Handling Similar Tips](#handling-similar-tips)
- [Future Models](#future-models)

## Introduction
TIP100 is a robust IT-enabled framework developed by DefinitelyNotPros from Jaypee Institute of Information Technology. The system allows users to provide tip-offs about any suspicious activity or crime to authorities while maintaining their anonymity.

## Goals
The primary objectives of TIP100 include:
- Ensuring the tipper's anonymity and privacy.
- Determining the accuracy of the tip.
- Calculating the trust score of the tip.
- Handling issues like fake tips, similar tips, and misreporting.

## Achieving Anonymity & Privacy
We employ blockchain technology to ensure the anonymity and privacy of our users. During login, users use a unique phrase unrelated to their identity. We do not record or display any private information such as location and IP address on our server.

## Tip Trust Score & Person Trust Score
We use a factorised and normalised version of the information provided by the user in the tip submission form. Machine Learning models process this data to generate a trust score, which measures the accuracy of the tip. 

The Tip Trust Score (TTS) is calculated using the formula:

    TTS = (0.2817a + 0.23717b + 0.198170c + 0.14317d + 0.09617e + 0.04917f) * 10

where:
- a = Likelihood of crime in that area
- b = User Trust Score
- c = Media Analysis Score = (audio analysis score + video/image score)
- d = Mental Awareness Quiz Score
- e = Text Analysis (Sentimental + Proper Nouns)
- f = Urgency of the Tip as Provided by the user

The Person Trust Score (PTS) is determined based on the correct tips submitted by the user.

## Machine Learning Models Implemented
We implement several Machine Learning models to improve the accuracy and reliability of the system. These models include:
- Probability of crime happening in the area: Returns percentage on a scale of 0-100 which is later normalised to a scale of 10.
- Media Analysis: 
    - Video/Image Analysis: Returns the type of crime taking place in that video/image which is then compared with the type of crime submitted in the form and the details and a score is generated which is either 0, 5 or 10.
    - Audio Analysis: Analyses the audio signals with different factors and classifications like pitch, and analog graphs and returns whether the person is telling the truth or is lying, which is, later on, scored 0 or 10.
- Text Analysis: The text is analysed for if there are any proper nouns that are present in the text or not, which are then judged on quantity and scored on a scale of 0-10.
- Mental Awareness Questionnaire: The user is asked a set of 5 questions based on the type of crime he is about to submit the tip-off. The questions have different scored marks which are used to generate a behavioural score for that person. Mental Awareness Quiz Score(d) = ∑(Marks of each question(0-10)) / Total Number of questions

## Handling Similar Tips
To manage multiple tips from the same location, we store them in a Tree Data-Structure. The tip with the highest trust score is marked as the root node. The police only see the root tip but can choose to view other tips on the same issue.

## Future Prospects
We plan to use the collected historic data on fake and similar tips to train future models and maintain a dataset of such tips. An evolving ML model will learn based on manual feedback received from the police on the tips. This approach will help us efficiently filter out incoming fake tips as the model becomes more accurate over time.
