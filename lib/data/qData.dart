const qPhishing = [
  {
    'question':
        'Ram is authorized to access the company data center using RFID badge.'
            ' Kishore from Procurement division, who is not authorized to access'
            ' the data center follows Ram into the data center without Ram\'s knowledge. '
            ' What is Kishore guilty of? ?',
    'answers': [
      {'answerText': 'Tailgating', 'score': true},
      {'answerText': 'Identify Fraud', 'score': false},
      {'answerText': 'Phishing', 'score': false},
    ],
  },
  {
    'question': 'You are a Security Officer in a company and you receive a call '
        'from the FBI asking for your username and password. '
        'What principle of influence has been employed against the user to gain credentials?',
    'answers': [
      {'answerText': '•	Familiarity/liking', 'score': false},
      {'answerText': '•	Urgency', 'score': false},
      {'answerText': '•	Authority', 'score': true},
    ],
  },
  {
    'question':
        'A user misspells the URL for an eCommerce website and is taken to a '
            'competing website. What attack has occurred here?',
    'answers': [
      {'answerText': '•	Watering hole attack', 'score': false},
      {'answerText': '•	Typo squatting', 'score': true},
      {'answerText': '•	Hoax', 'score': false},
    ],
  },
  {
    'question': 'Ram asks you the difference between a worm and virus. '
        'How would you explain this ?',
    'answers': [
      {
        'answerText': '•	Worms self-replicate without host file.',
        'score': true
      },
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question':
        'Malicious code is inserted into a running process, that uses instructions to '
            'load other programs at runtime. What attack is occurring here?',
    'answers': [
      {'answerText': 'SQL injection', 'score': false},
      {'answerText': 'XML injection', 'score': false},
      {'answerText': 'DLL injection', 'score': true},
    ],
  },
  {
    'question':
        'What can an attacker use to hijack a user’s session or cause the user '
            'accessing malware-tainted Site B to unknowingly attack Site A on behalf of the '
            'attacker who planted code on Site B?',
    'answers': [
      {'answerText': 'Input validation', 'score': false},
      {'answerText': 'XSS', 'score': true},
      {'answerText': 'Pass the Hash', 'score': false},
    ],
  },
  {
    'question':
        'What is the term for the process by which SIEM systems combine '
            'similar events into a log to reduce event volume ?',
    'answers': [
      {'answerText': 'Maneuvering', 'score': false},
      {'answerText': 'Log aggregation', 'score': true},
      {'answerText': 'Threat hunting', 'score': false},
    ],
  },
  {
    'question': 'In order to infiltrate a host, an attacker uses nmap to '
        'view open ports. What type of reconnaissance is this?',
    'answers': [
      {'answerText': 'OSINT', 'score': false},
      {'answerText': 'PASSIVE', 'score': false},
      {'answerText': 'Active', 'score': true},
    ],
  },
  {
    'question': 'A threat actor uses a carefully researched and crafted email '
        'requesting payment from the accounts payable (AP) department at your company.'
        'What attack has occurred here?',
    'answers': [
      {'answerText': 'A typo squat', 'score': false},
      {'answerText': '•	An invoice scam', 'score': true},
      {'answerText': '•	Smishing', 'score': false},
    ],
  },
  {
    'question': 'What does code signing prove?',
    'answers': [
      {
        'answerText':
            '•	It proves that faults are reduced by following an SDLC '
                'process',
        'score': false
      },
      {
        'answerText': '•	It proves that security concerns are managed at the '
            ' beginning of projects.',
        'score': false
      },
      {
        'answerText': 'It proves the author’s identity and provides assurance '
            'that the code has not been tampered with',
        'score': true
      },
    ],
  },
];

const qLevel1Basic = [
  {
    'question': 'Many systems are delivered via third parties. Adequate processes'
        ' need to be in place to manage the vendor relationships What is the most '
        'important aspect related to vendor management below',
    'answers': [
      {'answerText': '•	Systems operability between vendors', 'score': true},
      {'answerText': '•	Denial of service', 'score': false},
      {'answerText': 'Zero-day service', 'score': false},
    ],
  },
  {
    'question':
        'Deploying virtual data centers to multiple locations is an example ?',
    'answers': [
      {'answerText': '•	High availability', 'score': true},
      {'answerText': 'Cloud Diversity', 'score': false},
      {'answerText': 'Persistence', 'score': false},
    ],
  },
  {
    'question': 'Which of the following is a small OS used in '
        'embedded systems that typically run in an SoC?',
    'answers': [
      {'answerText': 'Zigbee', 'score': false},
      {'answerText': 'RTOS', 'score': true},
      {'answerText': 'RFID', 'score': false},
    ],
  },
  {
    'question': 'What class of fire involves  electrical equipment '
        'including desktop computers, and electrical wires?',
    'answers': [
      {'answerText': 'CLASS A', 'score': false},
      {'answerText': 'CLASS C', 'score': true},
      {'answerText': 'CLASS B', 'score': false},
    ],
  },
  {
    'question':
        'Which type of key is designed to be used for a single transaction?',
    'answers': [
      {'answerText': 'Persistent', 'score': false},
      {'answerText': 'Static', 'score': false},
      {'answerText': 'Ephemeral', 'score': true},
    ],
  },
  {
    'question':
        'What primary methods for encrypting plaintext data does symmetric encryption use?',
    'answers': [
      {'answerText': 'ECC and Stream Cipher', 'score': false},
      {'answerText': 'Block Cipher and non-repudiation', 'score': false},
      {'answerText': 'Sgtream and Block Cipher', 'score': true},
    ],
  },
  {
    'question': 'Which of the following is a fixed-size input of a random or '
        'pseudo-random value that helps ensure that each message encrypts differently?',
    'answers': [
      {'answerText': 'IV', 'score': true},
      {'answerText': 'Symmetric Key', 'score': false},
      {'answerText': 'Entropy', 'score': false},
    ],
  },
  {
    'question': 'A company is developing and testing code and needs an isolated '
        'environment with limited access to files on their host system. What should they use?',
    'answers': [
      {'answerText': 'Signing', 'score': false},
      {'answerText': 'Sandbox', 'score': true},
      {'answerText': 'Integrity Check', 'score': false},
    ],
  },
  {
    'question': 'IDS is not generating alerts, bu your network is being attacked. '
        'What is the term for an attack taking place but there is no detection',
    'answers': [
      {'answerText': 'False Negative', 'score': true},
      {'answerText': 'False Positive', 'score': false},
      {'answerText': 'Suspicious or Unknown', 'score': false},
    ],
  },
  {
    'question': 'Ram is reading an IEEE standard for port-based access '
        'control that provides for the encapsulation of EAP over the IEEE '
        'and various authentication methods, such as RADIUS and digital certificates. '
        'What standard is he reading about?',
    'answers': [
      {'answerText': '802.1X', 'score': true},
      {'answerText': 'OAuth2', 'score': false},
      {'answerText': 'SAML', 'score': false},
    ],
  },
];

const qLevel1IAM = [
  {
    'question': 'question IAM ?',
    'answers': [
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer2', 'score': false},
      {'answerText': 'answer3', 'score': false},
    ],
  },
  {
    'question': 'question 3-2 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question': 'question 3-3 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
    ],
  },
];

const qLevel1FW = [
  {
    'question': 'question FW ?',
    'answers': [
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer2', 'score': false},
      {'answerText': 'answer3', 'score': false},
    ],
  },
  {
    'question': 'question 3-2 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question': 'question 3-3 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
    ],
  },
];

const qLevel1Cert = [
  {
    'question': 'question Cert ?',
    'answers': [
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer2', 'score': false},
      {'answerText': 'answer3', 'score': false},
    ],
  },
  {
    'question': 'question 3-2 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question': 'question 3-3 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
    ],
  },
];

const qSecOpsL1c1 = [
  {
    'question':
        'Ram is reading a document describing what steps to take during and '
            'after a cybersecurity attack. What is Ram reading?',
    'answers': [
      {'answerText': 'Blacklist', 'score': false},
      {'answerText': 'Playbook', 'score': true},
      {'answerText': 'Runbook', 'score': false},
    ],
  },
  {
    'question': 'question 2-1 ?',
    'answers': [
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer2', 'score': false},
      {'answerText': 'answer3', 'score': false},
    ],
  },
  {
    'question': 'question 2-2 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question': 'question 2-3 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
    ],
  },
];

const qSecOpsL1c2 = [
  {
    'question': 'question SecopsL1 c2',
    'answers': [
      {'answerText': 'Blacklist', 'score': false},
      {'answerText': 'Playbook', 'score': true},
      {'answerText': 'Runbook', 'score': false},
    ],
  },
  {
    'question': 'question 2-1 ?',
    'answers': [
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer2', 'score': false},
      {'answerText': 'answer3', 'score': false},
    ],
  },
  {
    'question': 'question 2-2 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question': 'question 2-3 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
    ],
  },
];

const qSecOpsL2 = [
  {
    'question': 'question 3-1 ?',
    'answers': [
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer2', 'score': false},
      {'answerText': 'answer3', 'score': false},
    ],
  },
  {
    'question': 'question 3-2 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
      {'answerText': 'answer1', 'score': false},
    ],
  },
  {
    'question': 'question 3-3 ?',
    'answers': [
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': false},
      {'answerText': 'answer1', 'score': true},
    ],
  },
];
