---
name: domain-rl
domain: reinforcement-learning
description: Activate when writing or reviewing sections involving reinforcement learning, reward functions, policy optimization, or agent evaluation — injects RL terminology, algorithm taxonomy, evaluation standards (N>=5 seeds), and reward function documentation requirements.
version: 2.0.0
allowed-tools: Read,Glob
---

# Domain: Reinforcement Learning

Domain expertise for RL research sections. Targets: NeurIPS, ICML, ICLR, IEEE TNNLS, JMLR.

---

## Overview

**Invoke when**: writing about policy optimization, reward design, agent training, or RL evaluation.
**Pair with**: research-writer (drafting) or research-reviewer (critique).

---

## Section 1 — Core Terminology

| Term | Precise Definition |
|------|-------------------|
| Agent | The learner/decision-maker |
| Environment | External system agent acts upon |
| State (s) | Complete environment description at time t |
| Observation (o) | Partial state visible to agent |
| Action (a) | Agent decision at each timestep |
| Reward (r) | Scalar feedback from environment |
| Policy (pi) | Mapping from states to actions: pi(a|s) |
| Value V(s) | Expected cumulative reward from s under pi |
| Q-Function Q(s,a) | Expected cumulative reward from (s,a) pair |
| Discount (gamma) | 0<=gamma<=1 — weights future rewards |
| Return (G) | G_t = sum(gamma^k * r_{t+k}) |
| Episode | Complete sequence from initial to terminal state |
| Trajectory | Sequence of (state, action, reward) tuples |

---

## Section 2 — Algorithm Taxonomy

| Category | Examples | Key Characteristic |
|----------|---------|-------------------|
| Value-Based | DQN, Double DQN | Learns Q-function |
| Policy Gradient | REINFORCE, A2C | Directly optimizes policy |
| Actor-Critic | PPO, SAC, TD3 | Value + policy combined |
| Model-Based | Dreamer, MuZero | Learns dynamics |
| Multi-Agent | MADDPG, QMIX | Multiple interacting agents |

---

## Section 3 — Evaluation Standards

Training: episodic return, episode length, policy entropy
Test (N>=100 episodes): mean return +/- std dev, min/max, convergence episode
Statistical: >=5 independent random seeds, 95% CI on learning curves

---

## Section 4 — Reward Function Template

Define formally:
r_t = w1*r_task + w2*r_shaping - w3*r_penalty

State each component, value range, and rationale. Non-negotiable for Chapter 3.

---

## Section 5 — Canonical References

- Schulman, J., et al. (2017). PPO. arXiv:1707.06347.
- Mnih, V., et al. (2015). DQN. Nature, 518, 529-533.
- Sutton, R.S., & Barto, A.G. (2018). Reinforcement Learning (2nd ed.). MIT Press.

---

## Section 6 — Forbidden Phrases

| Forbidden | Correct |
|-----------|---------|
| "The agent learned" | "Mean return X +/- Y over 100 episodes" |
| "reward is high" | "Mean episodic return X (±Y, N=5 seeds)" |
| "converges" | "Policy converges at ~Xe6 timesteps (Figure X)" |

---

## Error Handling

Reward function undefined:
-> BLOCK: "Define reward function formally before drafting Chapter 3."

Seed count absent:
-> Flag: "[SEED COUNT NOT SPECIFIED — report mean +/- std over >=5 seeds]"
