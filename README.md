# A/B Testing

A/B testing (also known as split testing) is a controlled experiment used to compare two or more versions of a variable—such as a webpage, feature, or algorithm—to determine which performs better according to a defined metric (e.g., click-through rate, conversion rate, retention).

In a typical A/B test:

+ **Version A** (the control) is compared against **Version B** (the variant) under similar conditions.
+ Users are randomly assigned to one of the versions.
+ Their interactions are measured and analyzed to identify statistically significant differences.

A/B testing is widely used in product development, marketing, UX design, and data science to make data-driven decisions and optimize user experience without relying on guesswork.

This repository contains a guided example based on a chatbot hosted on our website.

## Suggested notebook order

1. [01_chatbot_ab_test_frequentist_workflow.ipynb](./01_chatbot_ab_test_frequentist_workflow.ipynb) covers the experiment background, data loading and cleaning, exploratory analysis, summary table creation, and the main frequentist A/B test
   evaluation.
2. [02_chatbot_ab_test_bayesian_followup.ipynb](./02_chatbot_ab_test_bayesian_followup.ipynb) introduces the Bayesian approach and re-evaluates the A/B test using the summarized output produced by [notebook 01](./01_chatbot_ab_test_frequentist_workflow.ipynb).
3. [03_chatbot_ab_test_experiment_design_and_power.ipynb](./03_chatbot_ab_test_experiment_design_and_power.ipynb) turns the findings into an actionable next experiment by comparing candidate primary metrics, planning sample sizes, estimating runtime, and defining a concrete follow-up test brief.

## Environment

### **`macOS`**

+ Create a virtual environment and install the required packages with the
  following commands:

  ```bash
  pyenv local 3.11.3
  python -m venv .venv
  source .venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  ```

### **`Windows`**

+ Create a virtual environment and install the required packages with the
  following commands.

  For `PowerShell`:

  ```PowerShell
  pyenv local 3.11.3
  python -m venv .venv
  .venv\Scripts\Activate.ps1
  python -m pip install --upgrade pip
  pip install -r requirements.txt
  ```

  For `Git Bash`:

  ```bash
  pyenv local 3.11.3
  python -m venv .venv
  source .venv/Scripts/activate
  python -m pip install --upgrade pip
  pip install -r requirements.txt
  ```
