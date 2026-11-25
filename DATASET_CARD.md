# Dataset Card: Civil Unrest March Event & Ground-Truth Corpus

## 1. Dataset Summary

This dataset repository contains historical social media microblog observations and verified event records assembled for studying civil unrest event extraction and 24-hour predictive forecasting in the National Capital Region (NCR), India. The primary unrest mobilization trigger under investigation is **"march"** (including foot marches, tractor rallies, and protest marches) during the period of the Indian Farmers' Agitation from **1 November 2020 to 21 November 2021**.

### Datasets Included:
1. **Farmers' Protest Tweet Corpus (2020–2021)**: Raw, interim, and processed microblog observations.
2. **ACLED India Conflict & Demonstration Dataset (NCR Subset)**: Armed Conflict Location & Event Data Project ground-truth unrest event records.
3. **Manual Ground-Truth Annotation Corpus (500 Posts)**: Rigorously annotated gold standard for march trigger and argument extraction.
4. **Inter-Annotator Agreement Sample (100 Posts)**: Double-annotated evaluation subset measuring Cohen's Kappa ($κ = 0.8490$).

---

## 2. Dataset Provenance & Licenses

| Dataset Component | Source Origin | License | Study Range | Record Count |
| :--- | :--- | :--- | :--- | :--- |
| **Farmers' Protest Tweets** | Public Research Tweet Archive / Kaggle | CC BY 4.0 | Nov 1, 2020 – Nov 21, 2021 | 1,500 raw / 1,256 cleaned |
| **ACLED India Records** | ACLED Data Export Portal | ACLED Non-Commercial Research License | Nov 1, 2020 – Nov 21, 2021 | 23 regional incidents |
| **Gold Annotated March Posts** | Human Research Annotator 1 | CC BY-NC 4.0 (Research Artifact) | Nov 2020 – Nov 2021 | 500 annotated posts |
| **2nd Annotator Reliability Sample** | Human Research Annotator 2 | CC BY-NC 4.0 (Research Artifact) | Stratified 20% sample | 100 double-coded posts |

---

## 3. Data Structure & Field Schemas

### A. Raw Tweet Archive (`data/raw/farmers_protest_tweets_sample.jsonl`)
- `tweet_id`: Unique platform tweet identifier.
- `text`: Raw post content.
- `created_at_utc`: ISO 8601 UTC timestamp.
- `user_id`: Pseudonymized user identifier.
- `reply_count`, `repost_count`, `like_count`, `quote_count`: Public engagement metrics.
- `media`: Flag indicating attached multimedia (`photo`, `video`, `none`).
- `mentions`: Mentioned public entities.
- `source`: Client platform.
- `user_location`: User profile location metadata.

### B. Annotated March Gold Standard (`data/labels/annotated_march_posts_500.json`)
Each post contains 13 audited research fields:
1. `is_march_event`: Binary label (1: genuine unrest march; 0: non-march/metaphor/month).
2. `trigger_text`: Exact lexical span denoting mobilization (e.g., `tractor march`, `foot march`).
3. `actor`: Mobilized social group (e.g., `farmers`, `students`, `workers`).
4. `organizer`: Institutional body or leader (e.g., `Samyukt Kisan Morcha`, `BKU Tikait`).
5. `location`: Canonical NCR location or landmark.
6. `target`: Target of grievance or destination (e.g., `Parliament`, `farm laws`).
7. `event_time`: Safe normalized timestamp or relative tag.
8. `scale_category`: Categorical crowd size (`small`, `medium`, `large`, `unknown`).
9. `event_status`: Temporal phase (`planned`, `ongoing`, `completed`).
10. `escalation_indicators`: Explicit conflict markers (`tear gas`, `water cannon`, `clashes`, `barricades`).
11. `source_language`: Primary language tag (`en`, `hi`, `pa`).
12. `confidence`: Annotation certainty score ($[0.0, 1.0]$).
13. `notes`: Contextual rationale explaining classification.

### C. Ground-Truth 24-Hour Windows (`data/labels/ncr_daily_acled_labels.csv`)
- `date`: Asia/Kolkata date ($YYYY-MM-DD$).
- `location`: Canonical NCR district (`New Delhi`, `Delhi`, `Gurugram`, `Noida`, `Ghaziabad`, `Faridabad`).
- `label`: Three-class unrest outcome:
  - `0`: No unrest recorded.
  - `1`: Peaceful march or demonstration.
  - `2`: Violent escalation, clash, riot, injury, or forced intervention.

---

## 4. Geographic & Temporal Boundaries

- **Target Locations (Initial NCR Scope)**:
  - `New Delhi` (Central landmarks: Jantar Mantar, Parliament, India Gate)
  - `Delhi` (Border hubs: Singhu Border, Tikri Border, Burari Ground, Red Fort, ITO)
  - `Gurugram` (Kherki Daula, Cyber City, Manesar Expressway)
  - `Noida` (Chilla Border, DND Flyway, Greater Noida Expressway)
  - `Ghaziabad` (Ghazipur Border, National Highway 24, Indirapuram)
  - `Faridabad` (Badarpur Border, Ballabhgarh)
- **Temporal Horizon**: 1 November 2020 through 21 November 2021 (386 continuous 24-hour observation windows per district).
- **Timezone Handling**: Microblogs are parsed in UTC internally and converted to `Asia/Kolkata` (IST, UTC+05:30) for daily calendar window aggregation.

---

## 5. Ethical Governance, Privacy, & Limitations

1. **No Scraped Private Data**: Data was sourced strictly from research-permitted public archives. No private messages, passwords, protected accounts, or sensitive personal attributes were harvested.
2. **Digital Representativeness Bias**: Social media users represent a technologically active, urban-connected subset of the population. Agrarian laborers lacking digital literacy or smartphone access are underrepresented.
3. **Repost Volatility & Astroturfing**: High retweet bursts often reflect digital coordinated diffusion rather than increased physical attendance. The pipeline discounts reposts ($0.2\times$) to prevent false alarms.
4. **Research Disclaimer**: This dataset is curated exclusively for academic benchmarks and peer-reviewed research. It must not be deployed for automated profiling, surveillance, or operational policing.
